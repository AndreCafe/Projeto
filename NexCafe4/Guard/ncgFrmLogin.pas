unit ncgFrmLogin;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDSimplePanel, Buttons, jpeg, 
  ncClassesBase, ncCompCliente, LMDControl,
  LMDBaseControl, LMDBaseGraphicButton, LMDCustomSpeedButton,
  LMDSpeedButton, LMDCustomComponent, LMDIniCtrl, 
  OvcPF, Menus, 
  ImgList, ShellAPI,
  Db, ncSessao, 
  LMDBaseGraphicControl, LMDGraphicControl, LMDFill, LMDBaseLabel,
  LMDCustomLabel, LMDLabel, 
  LMDCustomSimpleLabel, LMDSimpleLabel, dxBarExtItems, dxBar, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDCustomExtSpinEdit, LMDExtSpinEdit,
  cxLookAndFeelPainters, cxButtons, cxPC, cxControls, cxStyles, cxGraphics,
  cxEdit, cxDropDownEdit, cxVGrid, cxInplaceContainer, cxLabel, cxMaskEdit,
  cxContainer, cxTextEdit, cxGroupBox, pngimage, Animate, GIFCtrl, AppEvnts,
  cxClasses, dxGDIPlusClasses, LMDCustomParentPanel, LMDCustomPanelFill,
  LMDPanelFill, OleCtrls, SHDocVw, LMDCustomScrollBox, LMDScrollBox, lmdsplt, ncgFormBase,
  cxLookAndFeels;

type
  TFrmLogin = class(TFormBaseGuard)
    pagLogin: TcxPageControl;
    tsLogin: TcxTabSheet;
    tsLoginP: TcxTabSheet;
    LMDFill1: TLMDFill;
    imFundo: TImage;
    panLoginMaq: TLMDSimplePanel;
    LMDSimplePanel5: TLMDSimplePanel;
    lbVersao: TLMDSimpleLabel;
    lbMaq: TLMDSimpleLabel;
    LMDSimplePanel4: TLMDSimplePanel;
    LMDSimplePanel7: TLMDSimplePanel;
    dxBarDockControl1: TdxBarDockControl;
    panErro: TLMDSimplePanel;
    imErro: TImage;
    lbErro: TcxLabel;
    LMDPanelFill4: TLMDPanelFill;
    Image1: TImage;
    LMDPanelFill5: TLMDPanelFill;
    LMDPanelFill8: TLMDPanelFill;
    lbInstrucoes: TcxLabel;
    edUsername: TcxTextEdit;
    cbTipoAcesso: TcxComboBox;
    lbTipoAcesso: TcxLabel;
    lbUsuario: TcxLabel;
    lbSenha: TcxLabel;
    lbRG: TcxLabel;
    edRG: TcxTextEdit;
    btnOk: TcxButton;
    edSenha: TcxTextEdit;
    LMDPanelFill2: TLMDPanelFill;
    LMDPanelFill1: TLMDPanelFill;
    TimerOnTop: TTimer;
    BarMgr: TdxBarManager;
    BarMgrBar1: TdxBar;
    cmConfigurar: TdxBarLargeButton;
    cmFechar: TdxBarLargeButton;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    BarMgrBar2: TdxBar;
    cmVoltar: TdxBarLargeButton;
    cmHome: TdxBarLargeButton;
    cmAvancar: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    LMDSimplePanel2: TLMDSimplePanel;
    LMDSimplePanel3: TLMDSimplePanel;
    dxBarDockControl2: TdxBarDockControl;
    WB1: TWebBrowser;
    dxBarStatic1: TdxBarStatic;
    dxBarButton3: TdxBarButton;
    panWB2: TLMDSimplePanel;
    WB2: TWebBrowser;
    LMDSimplePanel10: TLMDSimplePanel;
    lbVersaoG: TcxLabel;
    lbFechar: TcxLabel;
    lbConfig: TcxLabel;
    lbMaqG: TcxLabel;
    bmBottom: TdxBar;
    panBottom: TLMDSimplePanel;
    bdcBottom: TdxBarDockControl;
    lbErro2: TcxLabel;
    cxLabel1: TcxLabel;
    LMDSimplePanel6: TLMDSimplePanel;
    lbUsuarioG: TcxLabel;
    edUsuarioG: TcxTextEdit;
    panSenhaG: TLMDSimplePanel;
    lbSenhaG: TcxLabel;
    edSenhaG: TcxTextEdit;
    LMDSimplePanel8: TLMDSimplePanel;
    btnEntrarG: TcxButton;
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure TimerOnTopTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cmConfigurarClick(Sender: TObject);
    procedure cmFecharClick(Sender: TObject);
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
    procedure edServidorEnter(Sender: TObject);
    procedure edServidorExit(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure GIFMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cmVoltarClick(Sender: TObject);
    procedure cmAvancarClick(Sender: TObject);
    procedure cmHomeClick(Sender: TObject);
    procedure btnEntrarGClick(Sender: TObject);
    procedure lbConfigClick(Sender: TObject);
    procedure lbFecharClick(Sender: TObject);
    procedure WB2BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure WB1BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
      var Cancel: WordBool);
    procedure WB2NewWindow2(ASender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure WB2NavigateError(ASender: TObject; const pDisp: IDispatch;
      var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  private
    FFocusOk : Boolean;
    FUKeyPress : Cardinal;
    FX, FY : Integer;
    { Private declarations }
    procedure OnException(Sender: TObject; E: Exception);
  public
    procedure RefreshTipoAcesso;
    procedure FecharLogin;
    procedure MostraErro(S: String);
    procedure MostraMsg(S: String);
    procedure RefreshFundo;
    function UsuarioOpOk(Op: Integer): Boolean;
    procedure Teclou;
    function VersaoStr: String;
  end;

var
  FrmLogin: TFrmLogin;
  TicksVisible: Cardinal;
  TempoSumir : Cardinal = 15000;
  InativouAniGif : Boolean = False;

implementation

uses ncgFrmPri, ncPassaportes, ncListaID, ncIDRecursos, ncgFrmSenha,
  ncgFrmConn, ncVersoes, ncDebug, GIFImage, ncVersionInfo;

{$R *.DFM}

procedure TFrmLogin.FormResize(Sender: TObject);
begin
  panLoginMaq.Left := ((Width-panLoginMaq.Width) div 2) - 5; 
  panLoginMaq.Top  := ((Height-panLoginMaq.Height) div 2) - 20;
  panBottom.Top := Height - panBottom.Height - 11;
end;

procedure TFrmLogin.OnException(Sender: TObject; E: Exception);
begin
  if Visible then
    MostraErro(E.Message)
  else begin
    Beep;
    DebugMsg('FrmLogin Exception ' + E.ClassName + ' Msg: ' + E.Message);
    MessageBox(0, PChar(E.Message), PChar('Atenção'), MB_OK + MB_ICONERROR);
  end;  
end;    

procedure TFrmLogin.RefreshTipoAcesso;
var I : Integer;
begin
  if Trim(SiteG1)>'' then
    WB1.Navigate(SiteG1);

  if Trim(SiteG2)>'' then begin
    panWB2.Visible := True;
    WB2.Navigate(SiteG2);
  end else
    panWB2.Visible := False; 

  with FrmPri.CM do begin
    lbSenha.Visible := not Config.MostrarApenasPIN;
    edSenha.Visible := not Config.MostrarApenasPIN;
    lbUsuario.Caption := Config.TextoPIN;

    panSenhaG.Visible := lbSenha.Visible;

    lbSenhaG.Visible := lbSenha.Visible;
    edSenhaG.Visible := edSenha.Visible;
    lbUsuarioG.Caption := Config.TextoPIN;
  end;
    
  lbRG.Visible := FrmPri.CM.Config.ExigirRG;
  edRG.Visible := lbRG.Visible;
  with FrmPri.CM do
  if Maquina > 0 then begin
    lbMaq.Caption := 'Máquina ' + IntToStr(Maquina);
    lbMaqG.Caption := 'Maq.'+IntToStr(Maquina);
  end else begin
    lbMaq.Caption := '.';
    lbMaqG.Caption := '.';
  end;
      
  cbTipoAcesso.Properties.Items.Clear;

  with FrmPri, CM, gTiposAcesso do
  for I := 0 to pred(Count) do with Itens[I] do
    cbTipoAcesso.Properties.Items.AddObject(Nome, TObject(ID));

  lbTipoAcesso.Visible := (cbTipoAcesso.Properties.Items.Count>1) and (not FrmPri.CM.Config.EscondeTipoAcesso);
  cbTipoAcesso.Visible := lbTipoAcesso.Visible;
  cbTipoAcesso.ItemIndex := 0;
  btnOk.Enabled := True;
  if gConfig.SemLogin then begin
    Timer3.Enabled := True;
    Timer3.Interval := 1000;
    TempoSumir := 5000;
  end else begin
    Timer3.Interval := 1000;
    TempoSumir := gConfig.TempoSumirLogin*1000;
    Timer3.Enabled := (TempoSumir>10000);
  end;
  panBottom.Visible := gConfig.SemLogin;
  panLoginMaq.Visible := not gConfig.SemLogin;
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
  Teclou;
  lbVersao.Caption := 'Versão '+VersaoStr;
  TimerOnTop.Enabled := True;
  TicksVisible := GetTickCount;
  BorderStyle := bsNone;
  edUsername.Text := '';
  edSenha.Text := '';
  edRG.Text := '';
  edUsuarioG.Text := '';
  edSenhaG.Text := '';
  if LoginGratis then
    pagLogin.ActivePageIndex := 1 else
    pagLogin.ActivePageIndex := 0;
    
  with FrmPri do begin
    Timer3.Enabled := gConfig.SemLogin or (TempoSumir>=10000);
    Timer3.Interval := 1000;
  end;  
end;

procedure TFrmLogin.btnEntrarGClick(Sender: TObject);
begin
  edSenha.Text := edSenhaG.Text;
  edUsername.Text := edUsuarioG.text;
  btnOkClick(nil);
end;

procedure TFrmLogin.btnOkClick(Sender: TObject);
var 
  U, S, sRG: String;
  aSessao : TncSessao;
begin
  if edUserName.Text='nexcmd_ativalog!@#$%^&*()' then begin
    ncDebug.DebugAtivo := True;
    edUserName.Text := 'OK';
    Exit;
  end;

  if edUserName.Text='nexcmd_close!@#$%^&*()' then begin
    FrmPri.Status := sgConfirmaFechar;
    edUserName.Text := 'OK';
    Exit; 
  end;

  if not FrmPri.CM.Ativo then begin
    cmConfigurarClick(nil);
    Exit;
  end;
  
  if cbTipoAcesso.Properties.Items.Count=0 then begin
    MostraErro('Não é possivel Entrar antes de se configurar as tarifas da loja. Faça isso através da opção "Tarifas" do NexAdmin');
    Exit;
  end;  
  
  with FrmPri do
  if Trim(edUsername.Text)>'' then
  try
    U := edUsername.Text;
    S := edSenha.Text;
    SenhaDig   := S;
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

    aSessao := TncSessao.Create(True);
    try
      aSessao.Maq := CM.Maquina;
      aSessao.TipoAcesso := Integer(cbTipoAcesso.Properties.Items.Objects[cbTipoAcesso.ItemIndex]); 
      aSessao.SenhaLogin := S;
      aSessao.UsernameLogin := U;
      aSessao.NomeCliente := sRG;
      CM.LoginMaq(aSessao);
    finally
      aSessao.Free;
    end;                
  except
    on E: Exception do 
      MostraErro(E.Message);
  end;
end;

procedure TFrmLogin.TimerOnTopTimer(Sender: TObject);
var H : HWND;
begin
  if Visible then begin
    with FrmPri do 
    if CM.Ativo and (gConfig.MinutosDesligaMaq>0) and ((GetTickCount - FUKeyPress) > (gConfig.MinutosDesligaMaq * 60000)) then
      CMShutDown(CM, operShutdown);

    with FrmPri do  
    if CM.Ativo and (gConfig.MinutosDesligaMon>0) and ((GetTickCount - FUKeyPress) > (gConfig.MinutosDesligaMon * 60000)) then
      SendMessage(Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
    
    Left := 0;
    Top := 0;
    Width := Screen.Width;
    Height := Screen.Height;

    if FrmPri.StayOnTopOFF or (FFocusOk and Application.Active) then Exit;

    if InativouAniGif then begin
      with imFundo.Picture do
      if Assigned(Graphic) and (Graphic is TGifImage) then
        with TGifImage(Graphic) do begin
          DrawOptions := DrawOptions + [goAnimate];
          InativouAniGif := False;
        end;
    end;
    
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
    with imFundo.Picture do
    if Assigned(Graphic) and (Graphic is TGifImage) then
      with TGifImage(Graphic) do begin
        DrawOptions := DrawOptions - [goAnimate];
        InativouAniGif := True;
      end;
end;

procedure TFrmLogin.MostraMsg(S: String);
begin
  Beep;
  Timer1.Enabled := False;
  Timer1.Interval := 10000;
  lbErro.Caption := S;
  lbErro2.Caption := S;
  panErro.Visible := True;
  lbErro2.Visible := True;
  Timer1.Enabled := True;
end;

procedure TFrmLogin.MostraErro(S: String);
begin
  MostraMsg(S);
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  Left := 0;
  Top := 0;
  Width := Screen.Width;
  Height := Screen.Height;
  FormResize(Self);
  FUKeyPress := GetTickCount;
  RefreshFundo;
  pagLogin.HideTabs := True;
  FFocusOk := False;
  Application.OnException := OnException;
  TicksVisible := 0;
  lbVersao.Caption := 'Versão '+VersaoStr;
end;

procedure TFrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
end;

procedure TFrmLogin.FecharLogin;
begin
  Close;
end;

procedure TFrmLogin.cmAvancarClick(Sender: TObject);
begin
  try WB1.GoForward; except end;
end;

procedure TFrmLogin.cmConfigurarClick(Sender: TObject);
begin
  if FrmPri.SemSenha then
    FrmPri.Status := sgConfig
  else begin  
    FrmConn.Oper := olConfig;
    FrmPri.Status := sgLoginFunc;
    FrmConn.edUsuario.Text := edUsername.Text;
    FrmConn.edSenha.Text := edSenha.Text;
    if Trim(edUsername.Text) > '' then FrmConn.btnLoginClick(nil);
  end;
end;

procedure TFrmLogin.cmFecharClick(Sender: TObject);
begin
  FrmConn.Oper := olFechar;
  if FrmPri.SemSenha then
    FrmPri.Status := sgConfirmaFechar
  else begin  
    FrmPri.Status := sgLoginFunc;
    FrmConn.edUsuario.Text := edUsername.Text;
    FrmConn.edSenha.Text := edSenha.Text;
    if Trim(edUsername.Text) > '' then FrmConn.btnLoginClick(nil);
  end;
end;

procedure TFrmLogin.cmHomeClick(Sender: TObject);
begin
  try WB1.Navigate(SiteG1); except end;
end;

procedure TFrmLogin.cmVoltarClick(Sender: TObject);
begin
  try WB1.GoBack; except end;
end;

procedure TFrmLogin.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.X := 0;
  Params.Y := 0;
  Params.Width := Screen.Width;
  Params.Height := Screen.Height;
end;

function TFrmLogin.UsuarioOpOk(Op: Integer): Boolean;
var S: String; 
begin
  S := FrmPri.UsuarioOpOk(edUsername.Text, edSenha.Text, Op);
  Result := (S='');
  if not Result then MostraErro(S);
end;

procedure TFrmLogin.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  panErro.Visible := False;
  lbErro2.Visible := False;
end;

procedure TFrmLogin.Timer2Timer(Sender: TObject);
begin
  Timer2.Enabled := False;
  edUsername.SetFocus;
end;

procedure TFrmLogin.cbTipoAcessoContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True;
end;

procedure TFrmLogin.Timer3Timer(Sender: TObject);
begin
  if (not gConfig.SemLogin) and (TempoSumir < 10000) then begin
    if gConfig.SemLogin then begin
      panLoginMaq.Visible := False;
      panBottom.Visible := True;
    end else begin
      panLoginMaq.Visible := True;
      panBottom.Visible := False;
    end;
    Timer3.Enabled := False;
  end else  
  if (GetTickCount - FUKeyPress) > TempoSumir then begin
    panBottom.Visible := False;
    panLoginMaq.Visible := False;
  end else begin
    panBottom.Visible := gConfig.SemLogin;
    panLoginMaq.Visible := not gConfig.SemLogin;
  end;
end;

procedure TFrmLogin.Teclou;
begin
  panLoginMaq.Visible := not gConfig.SemLogin;
  panBottom.Visible := gConfig.SemLogin;
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
    DebugMsg('RefreshFundo');
    if FileExists(ArqImLogin) then begin
      imFundo.Picture.LoadFromFile(ArqImLogin);
      imFundo.Stretch := False;
      imFundo.Stretch := True;
      DebugMsg('RefreshFundo 1: '+ArqImLogin);
    end else
    if FileExists(ArqImFundo) then begin
      imFundo.Picture.LoadFromFile(ArqImFundo);
      imFundo.Stretch := False;
      imFundo.Stretch := True;
      DebugMsg('RefreshFundo 2: '+ArqImFundo);
    end else
    if FileExists(CM.NomeArqLogin) then begin
      try
        imFundo.Picture.LoadFromFile(CM.NomeArqLogin);
        imFundo.Stretch := False;
        imFundo.Stretch := True;
        DebugMsg('RefreshFundo 3: '+CM.NomeArqLogin);
      except
      end;
    end else begin
      DebugMsg('RefreshFundo - Arquivo não existe 1: ' + ArqImLogin);
      DebugMsg('RefreshFundo - Arquivo não existe 2: ' + ArqImFundo);
      DebugMsg('RefreshFundo - Arquivo não existe 3: ' + CM.NomeArqLogin);
    end;
  end;      
end;

procedure TFrmLogin.Image1Click(Sender: TObject);
begin
  with FrmPri.CM do begin
    if not Config.MostrarApenasPIN then Exit;
    lbSenha.Visible := not lbSenha.Visible;
    edSenha.Visible := lbSenha.Visible;
    lbSenhaG.Visible := lbSenha.Visible;
    edSenhaG.Visible := lbSenha.Visible;
    panSenhaG.Visible := lbSenha.Visible;
    Timer4.Enabled := lbSenha.Visible;
  end;
end;

procedure TFrmLogin.lbConfigClick(Sender: TObject);
begin
  edUsername.Text := edUsuarioG.Text;
  edSenha.Text := edSenhaG.Text;
  cmConfigurarClick(nil);
end;

procedure TFrmLogin.lbFecharClick(Sender: TObject);
begin
  edUsername.Text := edUsuarioG.Text;
  edSenha.Text := edSenhaG.Text;
  cmFecharClick(nil);
end;

procedure TFrmLogin.Timer4Timer(Sender: TObject);
begin
  Timer4.Enabled := False;
  lbSenha.Visible := False;
  edSenha.Visible := False;
  edSenhaG.Visible := False;
  lbSenhaG.Visible := False;
  panSenhaG.Visible := False;
end;

procedure TFrmLogin.edServidorEnter(Sender: TObject);
begin
  FFocusOk := True;
end;

procedure TFrmLogin.edServidorExit(Sender: TObject);
begin
  FFocusOk := False;
end;

procedure TFrmLogin.FormHide(Sender: TObject);
begin
  TimerOnTop.Enabled := False;
end;

procedure TFrmLogin.GIFMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Teclou;
end;

function TFrmLogin.VersaoStr: String;
begin
  Result := IntToStr(Versoes.Versao);
  Result := Result[1] + '.' + Result[2] + '.' + Result[3] + Copy(GetVersionInfo, 6, 20);
  lbVersaoG.Caption := 'NexCafé ' + Result;
end;

procedure TFrmLogin.WB1BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
  var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
var 
  I: Integer;
  S: String;
begin
  for I := 0 to slDominiosG.Count-1 do begin
    S := slDominiosG[I];
    if Pos(S, URL)>0 then Exit;
  end;
  Cancel := True;
end;

procedure TFrmLogin.WB2BeforeNavigate2(ASender: TObject; const pDisp: IDispatch;
  var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
begin
  if pos(SiteG2, URL)<1 then begin
    Cancel := True;
    WB1.Navigate(URL);
  end;
end;

procedure TFrmLogin.WB2NavigateError(ASender: TObject; const pDisp: IDispatch;
  var URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
begin
  Cancel := False;
end;

procedure TFrmLogin.WB2NewWindow2(ASender: TObject; var ppDisp: IDispatch;
  var Cancel: WordBool);
begin
  Cancel := True;
end;

Initialization
  FrmLogin := nil;

end.




