unit uCMGLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, Buttons, jpeg, 
  cmClassesBase, cmServRemoto, cmCompCliente, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomComponent, LMDIniCtrl, 
  OvcPF, Menus, 
  ImgList, ShellAPI,
  Db, 
  LMDBaseGraphicControl, LMDGraphicControl, LMDFill, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, LMDVersionInfo,
  LMDCustomSimpleLabel, LMDSimpleLabel, dxBarExtItems, dxBar, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDCustomExtSpinEdit, LMDExtSpinEdit,
  cxLookAndFeelPainters, cxButtons, cxPC, cxControls, cxStyles, cxGraphics,
  cxEdit, cxDropDownEdit, cxVGrid, cxInplaceContainer, cxLabel, cxMaskEdit,
  cxContainer, cxTextEdit, cxGroupBox;

type
  TFrmLogin = class(TForm)
    panLoginMaq: TLMDSimplePanel;
    TimerOnTop: TTimer;
    LMDFill1: TLMDFill;
    imFundo: TImage;
    LMDFill3: TLMDFill;
    Paginas: TcxPageControl;
    tsLogin: TcxTabSheet;
    tsErro: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    Version: TLMDVersionInfo;
    BarMgr: TdxBarManager;
    cmConfigurar: TdxBarButton;
    cmFechar: TdxBarButton;
    dxBarDockControl1: TdxBarDockControl;
    cmNoNet: TdxBarStatic;
    cmVersao: TdxBarStatic;
    tsConexao: TcxTabSheet;
    LMDSimplePanel5: TLMDSimplePanel;
    lbCodSenha: TLMDLabel;
    Timer1: TTimer;
    cmErro: TdxBarStatic;
    btnErro: TcxButton;
    btnOkConn: TcxButton;
    btnCancelarConn: TcxButton;
    Timer2: TTimer;
    btnOk: TcxButton;
    edUsername: TcxTextEdit;
    cxLabel2: TcxLabel;
    gbErro: TcxGroupBox;
    lbMsgErro: TcxLabel;
    LMDSimplePanel2: TLMDSimplePanel;
    Image1: TImage;
    Timer3: TTimer;
    lbErroConn: TLMDLabel;
    LMDSimplePanel3: TLMDSimplePanel;
    cxLabel1: TcxLabel;
    edCodigo: TcxMaskEdit;
    cxLabel3: TcxLabel;
    edSenha: TcxTextEdit;
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure TimerOnTopTimer(Sender: TObject);
    procedure btnErroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmConfigurarClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
    procedure btnOkConnClick(Sender: TObject);
    procedure btnCancelarConnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    FExibindo : Boolean;
    FBar : TdxBar;
    FUKeyPress : Cardinal;
    FOperacao : Integer;
    { Private declarations }
    procedure OnException(Sender: TObject; E: Exception);
    procedure SetExibindo(const Value: Boolean);
  public
    procedure RefreshConexao;
    procedure ErroConn(S: String);
    procedure FecharLogin;
    procedure MostraErro(S: String);
    procedure MostraMsg(S: String);
    procedure MostraConn(OP: Integer);
    procedure Teclou;

    property Exibindo: Boolean
      read FExibindo write SetExibindo;
  end;

var
  FrmLogin: TFrmLogin;
  TicksVisible: Cardinal;

const
  opConfig   = 0;
  opConectar = 1;
  opFechar   = 2;  

implementation

uses uCMGPri, CMListaID, cmIDRecursos;

{$R *.DFM}

procedure TFrmLogin.FormResize(Sender: TObject);
begin
  panLoginMaq.Left := ((Width-panLoginMaq.Width) div 2) - 5; 
  panLoginMaq.Top  := ((Height-panLoginMaq.Height) div 2) - 20;
end;

procedure TFrmLogin.OnException(Sender: TObject; E: Exception);
begin
  MostraErro(E.Message);
end;    

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  FrmPri.FDesligaAviso := False;
  Application.OnException := nil;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TimerOnTop.Enabled := False;
  Action := caFree;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
var
  S : String;
begin
  RefreshConexao;
  Teclou;
  Timer3.Enabled := False;

  with FrmPri do begin
    S := ExtractFilePath(ParamStr(0)) + 'login.jpg';
    if not FileExists(S) then begin
      S := ExtractFilePath(ParamStr(0)) + 'fundo.jpg';
      if not FileExists(S) then
        S := FundoTela;
    end;
      
    if FileExists(S) then
    try
      imFundo.Picture.LoadFromFile(S);
      imFundo.Stretch := True;
      Timer3.Enabled := True;
    except
    end;    
  end;  
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
var U, S: String;
begin
  if Trim(edUsername.Text)>'' then
  try
    FrmPri.UserLogin(edUsername.Text);
  except
    on E: Exception do 
      MostraErro(E.Message);
  end;
end;

procedure TFrmLogin.TimerOnTopTimer(Sender: TObject);
var H : HWND;
begin
  if Exibindo then begin
    if FBar <> nil then
      FBar.Visible := not FrmPri.Conectado;
    Left := 0;
    Top := 0;
    Width := Screen.Width;
    Height := Screen.Height;
    
    ForceForegroundWindow(Handle);
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
    H := GetForeGroundWindow;
    if (H <> Handle) and (H <> FindWindow('Shell_TrayWnd', nil)) and ((GetTickCount-TicksVisible)<6000) then begin
      keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), 0, 0);
      keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), KEYEVENTF_KEYUP, 0);
      keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), 0, 0);
      keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), 0, 0);
      keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), KEYEVENTF_KEYUP, 0);
      keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
      SetForegroundWindow(Handle);
    end;  
  end;    
end;

procedure TFrmLogin.btnErroClick(Sender: TObject);
begin
  Paginas.ActivePage := tsLogin;
end;

procedure TFrmLogin.MostraMsg(S: String);
begin
  Beep;
  Timer1.Enabled := False;
  gbErro.Caption := 'Atenção';
  Timer1.Interval := 10000;
  lbMsgErro.Caption := S;
  Paginas.ActivePage := tsErro;
  Timer1.Enabled := True;
end;

procedure TFrmLogin.MostraErro(S: String);
begin
  Beep;
  Timer1.Enabled := False;
  Timer1.Interval := 10000;
  lbMsgErro.Caption := S;
  Paginas.ActivePage := tsErro;
  Timer1.Enabled := True;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  edCodigo.Text := FrmPri.slR.Values['CodLoja'];
  ErroConn('');
  TicksVisible := 0;
  tsLogin.TabVisible := False;
  tsErro.TabVisible := False;
  tsConexao.TabVisible := False;
  RefreshConexao;
  FExibindo := False;
  FBar := BarMgr.BarByName('NoNet');
  cmVersao.Caption := 'Versão '+ Version.FileVersion;
  Paginas.ActivePage := tsLogin;
  Application.OnException := OnException;
end;

procedure TFrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
end;

procedure TFrmLogin.FecharLogin;
begin
  Close;
end;

procedure TFrmLogin.SetExibindo(const Value: Boolean);
begin
  RefreshConexao;
  if Value=FExibindo then Exit;
  FExibindo := Value;
  TimerOnTop.Enabled := Value;
  if Value then begin
    Teclou;
    Show;
    TicksVisible := GetTickCount;
    Paginas.ActivePageIndex := 0;
    BorderStyle := bsNone;
    WindowState := wsMaximized;
    edUsername.Text := '';
    edSenha.Text := '';
  end else
    Hide;
end;

procedure TFrmLogin.cmConfigurarClick(Sender: TObject);
begin
  MostraConn(opConfig);
end;

procedure TFrmLogin.cmFecharClick(Sender: TObject);
begin
  MostraConn(opFechar);
end;

procedure TFrmLogin.btnOkConnClick(Sender: TObject);
begin
  with FrmPri do 
  if LojaSenhaOK(edCodigo.Text, edSenha.Text) then
  case FOperacao of 
    opFechar : begin
      Fechar := True;
      if Conectado then
        Conectado := False
      else
        FecharCMGuard;
    end;

    opConfig : begin
      Status := stConfig;
      Paginas.ActivePage := tsLogin;
    end;
      
    opConectar : begin
      mwCli.Username := edCodigo.Text;
      mwCli.Password := edSenha.Text;
      if not Conectado then 
      if not tmReconectar.Enabled then begin
        try
          Conectar(False);
          Paginas.ActivePage := tsLogin;
          edSenha.Text := '';
        except
          Beep;
        end;
      end else
        tmReconectarTimer(nil);  
    end;
  end;
end;

procedure TFrmLogin.btnCancelarConnClick(Sender: TObject);
begin
  edSenha.Text := '';
  Paginas.ActivePage := tsLogin;
end;

procedure TFrmLogin.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if Paginas.ActivePage=tsErro then
    Paginas.ActivePage := tsLogin;
end;

procedure TFrmLogin.RefreshConexao;
begin
end;

procedure TFrmLogin.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if Paginas.ActivePageIndex=0 then
    edUsername.SetFocus;
end;

procedure TFrmLogin.Timer3Timer(Sender: TObject);
begin
  if (GetTickCount - FUKeyPress) > 10000 then
    panLoginMaq.Visible := False;
end;

procedure TFrmLogin.Teclou;
begin
  panLoginMaq.Visible := True;
  FUKeyPress := GetTickCount;
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Teclou;
end;

procedure TFrmLogin.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  Teclou;
end;

procedure TFrmLogin.ErroConn(S: String);
begin
  lbErroConn.Caption := S;
  lbErroConn.Visible := (Trim(S)>'');
end;

procedure TFrmLogin.MostraConn(OP: Integer);
begin
  FOperacao := Op;
  case Op of
    opConfig   : btnOkConn.Caption := 'C&onfigurar';
    opFechar   : btnOkConn.Caption := '&Fechar';
    opConectar : btnOkConn.Caption := 'Co&nectar';
  else
    Exit;  
  end;  
  edSenha.Text := ''; 
  Paginas.ActivePage := tsConexao;
  edSenha.SetFocus;
end;

Initialization
  FrmLogin := nil;

end.
