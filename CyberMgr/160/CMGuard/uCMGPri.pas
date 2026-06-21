unit uCMGPri;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  cmCompCliente, LMDControl, LMDBaseControl, jpeg,
  LMDBaseGraphicControl, LMDGraphicControl, LMDBaseMeter, ShellApi,
  LMDCustomProgress, LMDProgress, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDSpeedButton, dxPageControl, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, LMDClock, LMDLEDCustomLabel, LMDLEDLabel,
  ExtCtrls, Menus, cmClassesBase, cmServRemoto, 
  LMDCustomStatusBar, LMDStatusBar,  xpbutton, 
  WindowList, LMDCustomSimpleLabel, LMDSimpleLabel, 
  ImgList, LMDCustomComponent, LMDStarter, LMDVersionInfo,
  madremote,
  ASGCapture, LMDSysInfo, cmProtecao, cmProtecao98, cmProxyProt, LMDIniCtrl,
  am2000menuitem, am2000utils, am2000popupmenu, am2000;

type
  TFrmPri = class(TForm)
    CM: TClienteCyberMgr;
    Paginas: TdxPageControl;
    tsConexao: TdxTabSheet;
    tsTempo: TdxTabSheet;
    btnFechar: TLMDSpeedButton;
    btnConfigurar: TLMDSpeedButton;
    Timer1: TTimer;
    CMRem: TCMServidorRemoto;
    StatusBar: TLMDStatusBar;
    panCrono: TLMDSimplePanel;
    btnFinalizaAcesso: TLMDSpeedButton;
    btnDireita: TLMDSpeedButton;
    lbTempo: TLMDLabel;
    lbValor: TLMDLabel;
    panDiv: TLMDSimplePanel;
    wlInicio: TWinList;
    WL: TWinList;
    lbConfig: TLMDSimpleLabel;
    imIcones: TImageList;
    Starter: TLMDStarter;
    Version: TLMDVersionInfo;
    Timer2: TTimer;
    Timer3: TTimer;
    btnSempreVis: TLMDSpeedButton;
    Timer4: TTimer;
    ASG: TASGScreenCapture;
    Timer5: TTimer;
    VI: TLMDVersionInfo;
    TimerWL: TTimer;
    SysInfo: TLMDSysInfo;
    Timer6: TTimer;
    lbQuaseTerm: TLMDLabel;
    LMDIniCtrl1: TLMDIniCtrl;
    pmIniciar: TPopupMenu;
    btnLogin: TLMDSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormOptionsRollUp(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnMinimizarClick(Sender: TObject);
    procedure btnTopoClick(Sender: TObject);
    procedure btnDireitaClick(Sender: TObject);
    procedure CMShutdown(Sender: TObject; Operacao: Byte);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CMAoDesativar(Sender: TObject);
    procedure btnFinalizaAcessoClick(Sender: TObject);
    procedure btnConfigurarClick(Sender: TObject);
    procedure CMAoAtualizarMaquina(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure btnSempreVisClick(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure CMAoPedirTela(Sender: TObject);
    procedure CMAoTransferirArq(Sender: TObject; Etapa: Byte; MsgID,
      TamArq, Posicao: Integer; NomeArq: String; Enviando: Boolean);
    procedure TimerWLTimer(Sender: TObject);
    procedure ShutQueryShutdown(Sender: TObject; var CanShutdown: Boolean);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
  private
    { Private declarations }
    FStatus : Integer;
    FslMenu : TStrings;
    FslRecursos : TStrings;
    FslConfig : TStrings;
    FShutOp : Integer;
    { Public declarations }
    FProgAtual: String;
    FSempreVis : Boolean;
    
    FSaveH, FSaveW : Integer;
    FContador: Integer;

    procedure SetStatus(Value: Integer);
    procedure TelaLogin(Mostrar: Boolean);
    procedure TelaPausa(Mostrar: Boolean);
    procedure Conectar;
    procedure ChecaEstadoMaq(M : TCMMaquina);
    procedure FechaProgramas;
  public
    FDesligaAviso : Boolean;
    FProt : TCMProtegeWindows;
  
    procedure LeMenu;
    procedure MenuItemClick(Sender: TObject);
    procedure FecharCMGuard;
  
    { Public declarations }
    property Status: Integer
      read FStatus write SetStatus;

    property slMenu: TStrings
      read FslMenu;

    property slRecursos: TStrings
      read FslRecursos;  

    property slConfig: TStrings
     read FslConfig;  

    property ProgAtual: String  
      read FProgAtual write FProgAtual;
  end;

  function IniFName: String;

  function ObtemEXE(S: String): String;
  function ObtemParams(S: String): String;

const
  stNaoCon    = 0;
  stConectado = 1;
  stConfig    = 2;
  stCliUsando = 3;
  stCliPausa  = 4;

  CorNormal = $00C8D0D4;
  CorPisca  = clYellow;

var
  FrmPri: TFrmPri;
  glShutOp : Integer;
  glForceShut : Boolean;
  glPowerOff : Boolean;

const
  Fechar : Boolean = False;  

implementation

uses Registry, uCMGPausa, uCMGLogin, uCMGConta, uCMGConfig, uCMGFrmAtualiza, cmIDRecursos;

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
  if CM.Ativo then
    CM.Ativo := False
  else
    FecharCMGuard;
end;

procedure TFrmPri.Timer1Timer(Sender: TObject);
var 
  Valor     : Double;
  Maq       : TCMMaquina;
  CredUsado : Cardinal;
  TA        : TCMTipoAcesso;
  MostraCron, MostraPreco : Boolean;
  Tempo, TempoCobrado : Cardinal;
begin
  with CM do 
  if (Paginas.ActivePage=tsTempo) and Ativo then begin

    Maq := Maquinas.PorNumero[Maquina];
    
    MostraCron := (slRecursos.Values['Cronometro']<>'F');
//    MostraPreco := (slRecursos.Values['Preco']='T');
    
    if (Maq<>nil) and (Maq.Acesso>0) and (not Maq.AguardaPagto) then begin
      TA := TiposAcesso.PorCodigo[Maq.TipoAcesso];
      if TA=nil then begin
        Tempo := 0;
        Valor := 0;
        TempoCobrado := 0
      end else begin  
        Maq.Calculo(Tempo, TempoCobrado, CredUsado, Valor, TA.PHoraCor^, CorPrecos, Config.PacoteTempoReal);

        Timer2.Enabled := (not FDesligaAviso) and 
                          (Maq.LimiteTempo>0) and 
                          (Tempo < Maq.LimiteTempo) and
                          ((DateTimeToTicks(Config.AlertaFimTempo) > Maq.LimiteTempo) or 
                          (Tempo >= (Maq.LimiteTempo - DateTimeToTicks(Config.AlertaFimTempo))));

        lbQuaseTerm.Visible :=  Timer2.Enabled or (
                                (Maq.LimiteTempo>0) and 
                                (Tempo < Maq.LimiteTempo) and
                                ((DateTimeToTicks(Config.AlertaFimTempo) > Maq.LimiteTempo) or 
                                (Tempo >= (Maq.LimiteTempo - DateTimeToTicks(Config.AlertaFimTempo)))));
                                
        lbQuaseTerm.Top := panDiv.Top - 1;
                                
                                  
        if not Timer2.Enabled then begin
          lbTempo.Color := CorNormal;
//          FormOptions.OnTop := btnSempreVis.Pressed;
        end else begin
//          FormOptions.OnTop := True;
          SetWindowPos(Self.Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
          if not Timer6.Enabled then begin
            Timer6.Interval := DateTimeToSegundos(Config.TempoMaxAlerta) * 1000;
            if Timer6.Interval>0 then
              Timer6.Enabled := True;
          end;  
        end;  
        
        if Config.MostraPrePagoDec and (Tempo<=Maq.LimiteTempo) and (Maq.CreditoCli<10000) then
          Tempo := Maq.LimiteTempo - Tempo;
      end;    
        
    

      if (Maq.LimiteTempo>0) and (Tempo >= Maq.LimiteTempo) and (not Maq.Parado) then
        PararMaq(Maq.Numero, True)
      else
      if Maq.ParadoPacote then
        Status := stCliPausa
      else
      if (not Maq.Parado) and (Status=stCliPausa) then
        Status := stCliUsando;
                                          
      lbTempo.Caption := TicksToHMSSt(Tempo);
      lbValor.Caption := FloatToStrF(Valor, ffCurrency, 10, 2);   
      lbTempo.Visible := MostraCron;
      lbValor.Visible := MostraCron;

      panCrono.Visible := MostraCron;

      if MostraCron {and MostraPreco} then
        Application.Title := lbTempo.Caption + ' = ' + lbValor.Caption
      else
        Application.Title := 'Cyber Manager';  
{      else
      if MostraCron then
        Application.Title := lbTempo.Caption
      else
      if MostraPreco then
        Application.Title := lbValor.Caption;}
        
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
{  if not Fechar then begin
    FormOptions.RollUp := False;
    FormOptions.OnTop := False;
  end;  }
end;

procedure TFrmPri.FormOptionsRollUp(Sender: TObject);
begin
{  if FormOptions.RollUp then begin
    Top := 0;
    FormOptions.OnTop := True;
  end else begin
    Caption := 'Cyber Manager';
    FormOptions.OnTop := False;
  end;}
end;

procedure TFrmPri.btnLoginClick(Sender: TObject);
begin
  if CM.Ativo then
    CM.ModoManutencao(CM.Maquina, False)
  else
    Conectar;
end;

procedure TFrmPri.btnMinimizarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmPri.btnTopoClick(Sender: TObject);
begin
{  FormOptions.Rollup := True;
  FormOptionsRollup(nil);}
end;

procedure TFrmPri.btnDireitaClick(Sender: TObject);
begin
  Left := Screen.Width - Width - 1;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFrmPri.Conectar;
var M : TCMMaquina;
begin
  CM.Maquina :=StrToIntDef(slConfig.Values['Maquina'], 0);
  CMRem.Host := slConfig.Values['Servidor'];
  CM.Programa := 'cmguard.exe';
  CM.Versao := FormataNumVersao(VI.FileVersion);
  CM.ArqDestino := ExtractFilePath(ParamStr(0))+'NCMGuard.EXE';
  
  CM.Ativo := True;

  if CM.BaixandoAtualizacao then Exit;

  DeleteFile(ExtractFilePath(ParamStr(0))+'NCMGuard.EXE');

{  CM.BaixaAtualizacao('cmguard.exe',
                      FormataNumVersao(VI.FileVersion), 
                      ExtractFilePath(ParamStr(0))+'NCMGuard.EXE');}
  
  M := CM.Maquinas.PorNumero[CM.Maquina];
  with M do begin
    slMenu.Text := Menu;
    slRecursos.Text := Recursos;
    AtualizaCache;
    ComputerName := SysInfo.Computername;
    CM.SalvaAlteracoesObj(M, False);
  end;  

  LeMenu;
  wlInicio.Refresh;
  Status := stConectado;
  if (CM.Maquina > 0) then
    ChecaEstadoMaq(CM.Maquinas.PorNumero[CM.Maquina]);
end;

procedure TFrmPri.FechaProgramas;
var I : Integer;
begin
  if not CM.Config.FecharProgramas then Exit;
  WL.Refresh;
  for I := 0 to pred(WL.Count) do with WL.Windows[I]^ do 
  if UpperCase(FName)='EXPLORER.EXE' then begin
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
    if M.Parado or M.ParadoPacote then
      Status := stCliPausa
    else
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

  with slRecursos do if FShutOp in [1..2] then
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
  TelaPausa((FStatus=stCliPausa));

  if (FStatus in [stCliPausa, stCliUsando]) and
     (Value=stConectado) and 
     (slRecursos.Values['Resetar']='T') then
    CMShutdown(nil, 1);
     
  tsConexao.Enabled := (FStatus in [stNaoCon, stConfig]);
  tsConexao.TabStop := tsConexao.Enabled;
  tsConexao.TabVisible := tsConexao.Enabled;

  with slRecursos do
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  if Values['StartPage']>'' then
    FProt.ForceIEStartPage(slRecursos.Values['StartPage']);

  tsTempo.Enabled := (not tsConexao.Enabled);
  tsTempo.TabStop := (not tsConexao.Enabled);
  tsTempo.TabVisible := (not tsConexao.Enabled);
  with slRecursos do
  case FStatus of 
    stNaoCon, stConfig : 
    begin
      if FrmConta <> nil then FrmConta.Close;
{      FormOptions.OnTop := False;
      FormOptions.RollUp := False;}
      Paginas.ActivePage := tsConexao;
      FProt.DesativaProtecao;
      if (FStatus = stConectado) and (Antes in [stCliUsando, stCliPausa]) then 
        FechaProgramas;
      lbQuaseTerm.Visible := False;
      FDesligaAviso := False;
      if CM.Ativo and (FStatus=stConfig) then  begin
        M := CM.Maquinas.PorNumero[CM.Maquina];
        if M=nil then
          U := nil
        else
          U := CM.Usuarios.PorUsername[M.UsuarioI];
          
        btnFechar.Visible := (M<>nil) and (U<>nil) and CM.Permitido(U, reMaquinas, taMaqFecharCMGuard);
      end;  
    end;
    
    stConectado, stCliPausa : 
    begin
      if FrmConta <> nil then FrmConta.Close;
      lbQuaseTerm.Visible := False;
      FDesligaAviso := False;
      FProt.SetOpcaoBool(cmp_noAltTab, True);
      FProt.SetOpcaoBool(cmp_noCtrlAltDel , (Values['CtrlAltDel']<>'T'));
      FProt.SetOpcaoBool(cmp_noAltEsc, True);
      FProt.SetOpcaoBool(cmp_noWinkeys, True);
      FProt.SetOpcaoBool(cmp_noTaskbar, True);
      FProt.SetOpcaoBool(cmp_noTaskLinks, False);
      FProt.SetOpcaoBool(cmp_noDesktop, True);
      FProt.SetOpcaoBool(cmp_noTaskTray, False);
      FProt.SetOpcaoBool(cmp_noCtrlEsc, True);
      FProt.NoStartMenu := True;
      FProt.AtivaProtecao;
      if (FStatus = stConectado) and (Antes in [stCliUsando, stCliPausa]) then 
        FechaProgramas;
    end;
                
    stCliUsando : 
    begin
      Timer6.Interval := DateTimeToSegundos(CM.Config.TempoMaxAlerta) * 1000;
    
      Paginas.ActivePage := tsTempo;
      FProt.SetOpcaoBool(cmp_noAltTab, False);
      FProt.SetOpcaoBool(cmp_noCtrlAltDel , (Values['CtrlAltDel']<>'T'));
      FProt.SetOpcaoBool(cmp_noAltEsc, False);
      FProt.SetOpcaoBool(cmp_noWinkeys , (Values['MenuIniciar']='F'));
      FProt.SetOpcaoBool(cmp_noTaskbar, False);
      FProt.SetOpcaoBool(cmp_noDesktop , (Values['Desktop']='F'));
      FProt.SetOpcaoBool(cmp_noTaskLinks , (Values['Desktop']='F'));
      FProt.SetOpcaoBool(cmp_noTaskTray , (Values['Tray']='F'));
      FProt.SetOpcaoBool(cmp_NoDownload, (Values['NoDownload']='T'));
      FProt.SetOpcaoBool(cmp_NoCtrlPanel, (Values['CtrlPanel']<>'T'));
      FProt.SetOpcaoBool(cmp_NoRunCmd, (Values['NoRunCmd']='T'));
      FProt.NoStartMenu := False;
      if (Values['MenuIniciar']='F') then 
        FProt.StartMenu := pmIniciar
      else 
        FProt.StartMenu := nil;
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
  glShutOp := -1;
  Height := 230;
  Width := 120;
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
  
  VI.RetrieveFileName := ParamStr(0);
  FSaveH := -1;
  FSaveW := -1;
  FShutOp := -1;
  FStatus := -1;
  FslConfig   := TStringList.Create;
  FslMenu     := TStringList.Create;
  FslRecursos := TStringList.Create;
  
  FProgAtual := '';
  if FileExists(IniFName) then FslConfig.LoadFromFile(IniFName);

  lbConfig.Caption := 'Máq: ' + slConfig.Values['Maquina'];
  btnLogin.Enabled := (slConfig.Values['Servidor']>'') and (slConfig.Values['Maquina']>'');
  
  Status := stNaoCon;
  Timer4.Enabled := True;
end;

procedure TFrmPri.FormDestroy(Sender: TObject);
begin
  FslMenu.Free;
  FslRecursos.Free;
  FslConfig.Free;
  FProt.DesativaProtecao;
end;

procedure TFrmPri.LeMenu;
var 
  I : Integer;
  MI : TMenuItem;
  Icone : TIcon;
begin
  pmIniciar.Items.Clear;

  MI := TMenuItem.Create(Self);
  MI.Caption := 'Finalizar este acesso';
  MI.OnClick := btnFinalizaAcessoClick;
  pmIniciar.Items.Add(MI);
  MI := TMenuItem.Create(Self);
  MI.Caption := '-';
  pmIniciar.Items.Add(MI);

  Icone := TIcon.Create;
  with slMenu do
  for I := 0 to pred(Count) do 
  if (ObtemExe(Values[Names[I]])='') or FileExists(ObtemExe(Values[Names[I]])) then begin
    MI := TMenuItem.Create(nil);
    MI.Caption := Names[I];
    MI.Tag := I;
    
    Version.RetrieveFilename := ObtemExe(Values[Names[I]]);
    if Version.RetrieveFilename>'' then begin
      Version.LargeIcons.GetIcon(0, Icone);
      imIcones.AddIcon(Icone);
      MI.ImageIndex := pred(imIcones.Count);
    end else
      MI.ImageIndex := -1;

    MI.OnClick := MenuItemClick;
    pmIniciar.Items.Add(MI);
  end;
end;

procedure TFrmPri.MenuItemClick(Sender: TObject);
var S, Exe: String;
begin
  with TMenuItem(Sender) do begin
    S := slMenu[Tag];
    System.Delete(S, 1, Pos('=', S));
    Exe := ObtemExe(S);
    if Exe='' then
      Exe := S;
    ShellExecute(Self.Handle, 'open', 
                 PChar(Exe), 
                 PChar(ObtemParams(S)),
                 PChar(ExtractFileDir(ObtemEXE(S))),
                 SW_SHOWNORMAL);
  end;  
end;

procedure TFrmPri.TelaLogin(Mostrar: Boolean);
begin
  if Mostrar then begin
    Hide;
    if FrmLogin=nil then begin
      FrmLogin := TFrmLogin.Create(Self);
      FrmLogin.Show;
    end;
  end else
  if FrmLogin<>nil then begin
    Show;
    FrmLogin.FecharLogin;
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
    FrmPausa.Close;    
  end;  
end;

procedure TFrmPri.CMAoDesativar(Sender: TObject);
begin
  FecharCMGuard;
end;

procedure TFrmPri.btnFinalizaAcessoClick(Sender: TObject);
begin
  with CM do begin
    PreLogoutMaq(Maquina);
    if TFrmConta.Create(Self).Confirma(lbTempo.Caption, lbValor.Caption) then
      LogoutMaq(Maquina)
    else
      CancLogoutMaq(Maquina);  
  end;    
end;

procedure TFrmPri.btnConfigurarClick(Sender: TObject);
begin
  TFrmConfig.Create(Self).ShowModal;
  btnLogin.Enabled := (CM.Ativo) or (slConfig.Values['Servidor']>'') and (slConfig.Values['Maquina']>'');
  LeMenu;
end;

procedure TFrmPri.CMAoAtualizarMaquina(Sender: TObject);
begin
  if TCMMaquina(Sender).Numero = CM.Maquina then 
    ChecaEstadoMaq(TCMMaquina(Sender));
end;

procedure TFrmPri.FormShow(Sender: TObject);
begin
  btnDireitaClick(nil);
end;

procedure TFrmPri.Timer3Timer(Sender: TObject);
begin
  Application.Restore;
end;

procedure TFrmPri.btnSempreVisClick(Sender: TObject);
begin
//  FormOptions.OnTop := btnSempreVis.Pressed;
end;

procedure TFrmPri.Timer4Timer(Sender: TObject);
begin
  Timer4.Enabled := False;
  if btnLogin.Enabled then begin
    btnFechar.Enabled := False;
    try
      Conectar; 
    finally
      btnFechar.Enabled := True;
    end;
  end;    
end;

procedure TFrmPri.Timer5Timer(Sender: TObject);
var 
  S: TMemoryStream;
  J: TJpegImage;
begin
  Timer5.Enabled := False;
  S := TMemoryStream.Create;
  J := TjpegImage.Create;
  try
    J.Assign(ASG.CaptureDesktop);
    J.CompressionQuality := 60;
    J.Compress;
    J.SaveToStream(S);
    CM.SalvaTela(S);
  except
    Timer5.Enabled := False;
  end;
  J.Free;
  S.Free;
end;

procedure TFrmPri.CMAoPedirTela(Sender: TObject);
begin
  Timer5.Enabled := True;
end;

procedure TFrmPri.CMAoTransferirArq(Sender: TObject; Etapa: Byte; MsgID,
  TamArq, Posicao: Integer; NomeArq: String; Enviando: Boolean);
begin
  if Etapa=2 then begin
    if CM.Ativo then
      CM.Ativo := False
    else
      FecharCMGuard;
    ExecFile(ExtractFilePath(ParamStr(0))+'NCMGuard.EXE');
  end;
end;

procedure TFrmPri.TimerWLTimer(Sender: TObject);
var 
  S: String;
  Maq : TCMMaquina;
begin
  if not CM.Ativo then Exit;
  
  WL.Refresh;
  S := WL.CaptionForeGround;
{  Inc(FContador);
  S := IntToStr(FCOntador);}
  if S <> ProgAtual then begin
    ProgAtual := S;
    Maq := CM.Maquinas.PorNumero[CM.Maquina];
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

procedure TFrmPri.Timer2Timer(Sender: TObject);
begin
  if lbTempo.Color = CorNormal then
    lbTempo.Color := CorPisca
  else  
    lbTempo.Color := CorNormal;
end;

procedure TFrmPri.Timer6Timer(Sender: TObject);
begin
  Timer6.Enabled := False;
  FDesligaAviso := True;
end;

end.
