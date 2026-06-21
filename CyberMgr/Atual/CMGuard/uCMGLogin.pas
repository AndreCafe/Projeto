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
  cxContainer, cxTextEdit, cxGroupBox, pngimage, Animate, GIFCtrl;

type
  TFrmLogin = class(TForm)
    panLoginMaq: TLMDSimplePanel;
    TimerOnTop: TTimer;
    LMDFill1: TLMDFill;
    imFundo: TImage;
    lbCab: TLMDFill;
    Paginas: TcxPageControl;
    tsLogin: TcxTabSheet;
    tsErro: TcxTabSheet;
    LMDSimplePanel1: TLMDSimplePanel;
    Version: TLMDVersionInfo;
    BarMgr: TdxBarManager;
    cmConfigurar: TdxBarButton;
    cmFechar: TdxBarButton;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarDockControl1: TdxBarDockControl;
    cmNoNet: TdxBarStatic;
    cmVersao: TdxBarStatic;
    tsConexao: TcxTabSheet;
    LMDSimplePanel5: TLMDSimplePanel;
    lbErroConn: TLMDLabel;
    Label3: TLabel;
    edServidor: TEdit;
    Label5: TLabel;
    edMaquina: TLMDExtSpinEdit;
    Timer1: TTimer;
    cmErro: TdxBarStatic;
    btnErro: TcxButton;
    btnOkConn: TcxButton;
    btnCancelarConn: TcxButton;
    Timer2: TTimer;
    btnOk: TcxButton;
    edSenha: TcxTextEdit;
    edUsername: TcxTextEdit;
    cbTipoAcesso: TcxComboBox;
    lbTipoAcesso: TcxLabel;
    lbUsuario: TcxLabel;
    lbSenha: TcxLabel;
    gbErro: TcxGroupBox;
    lbMsgErro: TcxLabel;
    panMaqImagemChave: TLMDSimplePanel;
    Image1: TImage;
    Timer3: TTimer;
    GIF: TRxGIFAnimator;
    edRG: TcxTextEdit;
    lbRG: TcxLabel;
    Timer4: TTimer;
    lbNumMaq: TLMDLabel;
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
    procedure cbTipoAcessoContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure Timer3Timer(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1Click(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
  private
    FExibindo : Boolean;
    FBar : TdxBar;
    FUKeyPress : Cardinal;
    FX, FY : Integer;
    { Private declarations }
    procedure OnException(Sender: TObject; E: Exception);
    procedure SetExibindo(const Value: Boolean);
  public
    procedure RefreshTipoAcesso;
    procedure RefreshConexao;
    procedure FecharLogin;
    procedure MostraErro(S: String);
    procedure MostraMsg(S: String);
    procedure RefreshFundo;
    function UsuarioOpOk(Op: Integer): Boolean;
    procedure Teclou;

    property Exibindo: Boolean
      read FExibindo write SetExibindo;
  end;

var
  FrmLogin: TFrmLogin;
  TicksVisible: Cardinal;
  TempoSumir : Cardinal = 15000;

implementation

uses uCMGPri, CMListaID, cmIDRecursos, ucmaFrmSenha;

{$R *.DFM}

procedure TFrmLogin.FormResize(Sender: TObject);
begin
  panLoginMaq.Left := ((Width-panLoginMaq.Width) div 2) - 5; 
  panLoginMaq.Top  := ((Height-panLoginMaq.Height) div 2) - 20;
end;

procedure TFrmLogin.OnException(Sender: TObject; E: Exception);
begin
  if Exibindo then 
    MostraErro(E.Message)
  else begin
    Beep;
    MessageBox(0, PChar(E.Message), PChar('Atenção'), MB_OK + MB_ICONERROR);
  end;  
end;    

procedure TFrmLogin.RefreshTipoAcesso;
var I : Integer;
begin
  with FrmPri.CM do begin
    lbSenha.Visible := not Config.MostrarApenasPIN;
    edSenha.Visible := not Config.MostrarApenasPIN;
    lbUsuario.Caption := Config.TextoPIN;
  end;
    
  lbRG.Visible := FrmPri.CM.Config.ExigirRG;
  edRG.Visible := lbRG.Visible;
  with FrmPri.CM do
  if Maquina > 0 then 
    lbNumMaq.Caption := 'Máq: ' + IntToStr(Maquina)
  else
    lbNumMaq.Caption := '.';
      
  cbTipoAcesso.Properties.Items.Clear;

  with FrmPri, CM, TiposAcesso do
  for I := 0 to pred(Count) do with Itens[I] do
    cbTipoAcesso.Properties.Items.AddObject(Nome, TObject(Codigo));

  lbTipoAcesso.Visible := (cbTipoAcesso.Properties.Items.Count>1) and (not FrmPri.CM.Config.EscondeTipoAcesso);
  cbTipoAcesso.Visible := lbTipoAcesso.Visible;
  cbTipoAcesso.ItemIndex := 0;
  btnOk.Enabled := True;
  Timer3.Enabled := (TempoSumir>10000);
  Timer3.Interval := TempoSumir;
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
begin
  RefreshConexao;
  with FrmPri do begin
    Timer3.Enabled := (TempoSumir>=10000);
    Timer3.Interval := TempoSumir;
  end;  
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
var U, S, sRG: String;
begin
  if cbTipoAcesso.Properties.Items.Count=0 then begin
    MostraErro('Não é possivel Entrar antes de se configurar as tarifas da loja. Faça isso através da opção "Tarifas" do Admnistrador do Cyber Manager');
    Exit;
  end;  
  
  with FrmPri do
  if Trim(edUsername.Text)>'' then
  try
    U := edUsername.Text;
    S := edSenha.Text;
    SenhaCli   := S;
    StatusSenha := ssSenhaObtida;
    
    ObtemPassUsernameSenha(U, S);
    if UpperCase(U)='PREPAGO' then begin
      U := 'PREPAGO';
      S := UpperCase(S);
    end;  
    if lbRG.Visible then 
      sRG := '@RG@'+Trim(edRG.Text)
    else
      sRG := '';  
      
    CM.LoginMaq(CM.Maquina, 0, U, S, sRG, '', 0, 0, 
                Integer(cbTipoAcesso.Properties.Items.Objects[cbTipoAcesso.ItemIndex])); 
      
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
      FBar.Visible := not FrmPri.CM.Ativo;
    GIF.Animate := True;
    Left := 0;
    Top := 0;
    Width := Screen.Width;
    Height := Screen.Height;
    if FrmPri.StayOnTopOFF then Exit;
    
    ForceForegroundWindow(Handle);
    SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, (SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE));
    H := GetForeGroundWindow;
    ShowWindow(Handle, SW_SHOW);
    if (H <> Handle) and (H <> FindWindow('Shell_TrayWnd', nil)) and ((GetTickCount-TicksVisible)<6000) then begin
      keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), 0, 0);
      keybd_event(VK_LWIN, Mapvirtualkey(VK_LWIN, 0), KEYEVENTF_KEYUP, 0);
      keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), 0, 0);
      keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), 0, 0);
      keybd_event(VK_ESCAPE, Mapvirtualkey(VK_ESCAPE, 0), KEYEVENTF_KEYUP, 0);
      keybd_event(VK_CONTROL, Mapvirtualkey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
      SetForegroundWindow(Handle);
    end;  
  end else
    GIF.Animate := False;    
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
  Application.OnException := OnException;
  TicksVisible := 0;
  tsLogin.TabVisible := False;
  tsErro.TabVisible := False;
  tsConexao.TabVisible := False;
  RefreshConexao;
  FExibindo := False;
  FBar := BarMgr.BarByName('NoNet');
  cmVersao.Caption := 'Versão '+Version.FileVersion;
  Paginas.ActivePage := tsLogin;
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
    Show;
    TicksVisible := GetTickCount;
    Paginas.ActivePageIndex := 0;
    BorderStyle := bsNone;
    WindowState := wsMaximized;
    edUsername.Text := '';
    edSenha.Text := '';
    edRG.Text := '';
  end else 
    Hide;
end;

procedure TFrmLogin.cmConfigurarClick(Sender: TObject);
begin
  if UsuarioOpOk(daMaqFecharCMGuard) then
    Paginas.ActivePage := tsConexao;
end;

procedure TFrmLogin.cmFecharClick(Sender: TObject);
begin
  with FrmPri do
  if UsuarioOpOk(daMaqFecharCMGuard) then begin
    Fechar := True;
    if CM.Ativo then
      CM.Ativo := False
    else
      FecharCMGuard;
  end;
end;

function TFrmLogin.UsuarioOpOk(Op: Integer): Boolean;
var U: TCMUsuario;
begin
  Result := (FrmPri.CM.Usuarios.Count=0);
  if Result then Exit;

  with FrmPri.CM do
//  if Trim(edUsername.Text)>'' then
  try
    U := Usuarios.PorUsername[edUsername.Text];
    if U = nil then
      MostraErro('Nome de usuário inválido')
    else
    if U.Senha <> edSenha.Text then
      MostraErro('Senha inválida')
    else
    if not Permitido(U, Op) then
      MostraErro('Você não tem permissão para executar essa operação. '+
                 'Caso seja a primeira vez que você executa o CM-Guard, '+
                 'você poderá utilizar o usuário "admin" e deixar a senha '+
                 'em branco.')
    else
      Result := True;
  except
  end;
end;

procedure TFrmLogin.btnOkConnClick(Sender: TObject);
begin
  with FrmPri do begin
    slConfig.Values[NomeMaq] := edMaquina.AsString;
    slConfig.Values['Servidor'] := edServidor.Text;
    slConfig.SaveToFile(IniFName);
    if not CM.Ativo then begin
      if not tmReconectar.Enabled then begin
        try
          Conectar(False);
          Paginas.ActivePage := tsLogin;
          edUsername.Text := '';
          edSenha.Text := '';
          edRG.Text := '';
        except
          Beep;
        end;
      end else
        tmReconectarTimer(nil);  
    end else
      MostraMsg('As alterações realizadas só terão efeito na próxima conexão '+
                'com o servidor. Se desejar ativá-las agora é necessário '+
                'fechar e re-abrir o CM-Guard.');
  end;
end;

procedure TFrmLogin.btnCancelarConnClick(Sender: TObject);
begin
  edUsername.Text := '';
  edSenha.Text := '';
  edRG.Text := '';
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
  with FrmPri, slConfig do begin
    lbNumMaq.Caption := 'Maq: ' + Values[NomeMaq];
    edServidor.Text  := Values['Servidor'];
    edMaquina.Value  := StrToIntDef(Values[NomeMaq], 0);
  end;  
end;

procedure TFrmLogin.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  if Paginas.ActivePageIndex=0 then
    edUsername.SetFocus;
end;

procedure TFrmLogin.cbTipoAcessoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TFrmLogin.Timer3Timer(Sender: TObject);
begin
  if (GetTickCount - FUKeyPress) > TempoSumir then
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
var P : TPoint;  
begin
  P.X := X;
  P.Y := Y;
  P := TControl(Sender).ClientToScreen(P);
  if (P.X <> FX) or (P.Y <> FY) then
    Teclou;
  FX := P.X;
  FY := P.Y;  
end;

procedure TFrmLogin.RefreshFundo;
begin
  with FrmPri do begin
    if FileExists(CM.NomeArqLogin) then
    try
      if Pos('.gif', LowerCase(CM.NomeArqLogin))>0 then begin
        GIF.Image.LoadFromFile(CM.NomeArqLogin);
        GIF.Stretch := True;
        GIF.Animate := True;
      end else begin
        imFundo.Picture.LoadFromFile(CM.NomeArqLogin);
        imFundo.Stretch := False;
        imFundo.Stretch := True;
      end;  
    except
    end;  
  end;      
end;

procedure TFrmLogin.Image1Click(Sender: TObject);
begin
  with FrmPri.CM do begin
    if not Config.MostrarApenasPIN then Exit;
    lbSenha.Visible := not lbSenha.Visible;
    edSenha.Visible := lbSenha.Visible;
    Timer4.Enabled := lbSenha.Visible;
  end;
end;

procedure TFrmLogin.Timer4Timer(Sender: TObject);
begin
  Timer4.Enabled := False;
  lbSenha.Visible := False;
  edSenha.Visible := False;
end;

Initialization
  FrmLogin := nil;

end.
